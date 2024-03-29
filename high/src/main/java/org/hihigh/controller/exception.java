package org.hihigh.controller;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class exception {
   
   @ExceptionHandler(NoHandlerFoundException.class)
   @ResponseStatus(HttpStatus.NOT_FOUND)
   public String handle404(NoHandlerFoundException ex, Model model) {
      model.addAttribute("error", "에러페이지");
      return "/error/custom404";
}
   
}