package szitu.springboot.model;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Result<T> {
    private boolean success;
    private String message;
    private T data;
    private Long length;
    private Long code = 200L;

    public Result(boolean success, String message, T data, Long length) {
        this.success = success;
        this.message = message;
        this.data = data;
        this.length = length;
    }

    public Result(Long code) {
        this.code = code;
    }

    public static <T> Result<T> success(T data) {
        return new Result<>(true, null, data, 0L);
    }
    public static <T> Result<T> fail(Long code) {
        return new Result<>(code);
    }
    public static <T> Result<T> fail(String message) {
        return new Result<>(false, message, null, 0L);
    }

    public static <T> Result<T> searchRes(T data, Long length) {
        return new Result<>(true, null, data, length);
    }


}