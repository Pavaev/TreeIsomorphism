package project.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import project.exception.NotFoundException;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Daniel Shchepetov on 02.04.2016.
 */


    @ControllerAdvice
    public class ExceptionHandlerController {

        @ExceptionHandler(value = {NotFoundException.class, NoHandlerFoundException.class})
        public ModelAndView informedView(HttpServletRequest req, Exception exception) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("exception", exception);
            mav.addObject("url", req.getRequestURL());
            mav.setViewName("exception");
            return mav;

    }

}
