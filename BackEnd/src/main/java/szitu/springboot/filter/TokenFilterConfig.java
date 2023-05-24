package szitu.springboot.filter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TokenFilterConfig {
    @Bean
    public FilterRegistrationBean<TokenFilter> tokenFilter() {
        FilterRegistrationBean<TokenFilter> registration = new FilterRegistrationBean<>();
        registration.setFilter(new TokenFilter());
        registration.addUrlPatterns("/*"); // 设置过滤器的URL模式
        registration.addInitParameter("exclusions", "/file/word/download,/file/sheet/download,/file/attachment/download,/file/download,/file/upload,/examine/auth,/region/getOneMess,/user/login,/user/register,/school/getAll,/committee/,/region/getAll,/region/select,/obstacle/getAll,/grade/getAll"); // 排除/login URL
        registration.setName("TokenFilter");
        registration.setOrder(1); // 设置过滤器的优先级
        return registration;
    }
}