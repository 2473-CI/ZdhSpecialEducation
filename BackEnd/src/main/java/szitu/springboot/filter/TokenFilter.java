package szitu.springboot.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.utils.DesEncryption;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TokenFilter implements Filter {
    private static final String TOKEN_NAME = "token"; // 定义Token字段的名称
    private static final String ROLE_NAME = "role"; // 定义Token字段的名称
    private static final String EXCLUSIONS_PARAM = "exclusions";
    private List<String> exclusions = new ArrayList<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String exclusionsParam = filterConfig.getInitParameter(EXCLUSIONS_PARAM);
        if (exclusionsParam != null) {
            String[] urls = exclusionsParam.split(",");
            for (String url : urls) {
                exclusions.add(url.trim());
            }
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        if (request.getMethod().equals("OPTIONS")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        String token = request.getHeader(TOKEN_NAME); // 获取请求头中的Token字段值
        String requestUri = request.getRequestURI();
        System.out.print(requestUri);
        System.out.println(token);
        if(requestUri.startsWith("/image")){
            System.out.println(">>>>>:");
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        if (!isExcluded(requestUri)) {
            if (token == null || token.isEmpty()) {
                HttpServletResponse response = (HttpServletResponse) servletResponse;
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 返回401 Unauthorized状态码
                response.getWriter().write(new ObjectMapper().writeValueAsString(Result.fail(401L)));
            } else {
                ObjectMapper objectMapper = new ObjectMapper();
                Role role = null;
                try {
                    System.out.println(DesEncryption.decode(token));
                    role = objectMapper.readValue(DesEncryption.decode(token), Role.class);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                long timestamp = role.getDate().getTime(); // 给定时间戳
                long currentTimestamp = System.currentTimeMillis(); // 当前时间戳
                long delta = currentTimestamp - timestamp; // 时间差
                boolean isWithinSixHours = delta <= 6 * 60 * 60 * 1000; // 时间差是否小于六小时
                if(! isWithinSixHours){
                    HttpServletResponse response = (HttpServletResponse) servletResponse;
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
                    response.getWriter().write(new ObjectMapper().writeValueAsString(Result.fail(403L)));
                    return;
                }
                // TODO
                request.setAttribute(ROLE_NAME, role);
                filterChain.doFilter(servletRequest, servletResponse); // 继续执行过滤器链
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse); // 不需要进行Token验证的请求直接放行
        }
    }

    private boolean isExcluded(String requestUri) {
        for (String url : exclusions) {
            if (requestUri.endsWith(url)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void destroy() {
        // 过滤器销毁操作
    }
}