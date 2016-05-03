package project.exception;

/**
 * Created by Daniel Shchepetov on 02.04.2016.
 */

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND,  reason = "Object Not Found")
public class NotFoundException extends RuntimeException {
    NotFoundException(){
        super();
    }
}
