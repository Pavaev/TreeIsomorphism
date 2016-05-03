package project.model;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


/**
 * Created by Daniel Shchepetov on 02.04.2016.
 */
public class ComplaintValidator implements Validator {
    @Override
    public boolean supports(Class clas) {
        return Complaint.class.equals(clas);
    }

    @Override
    public void validate(Object obj, Errors e) {
        ValidationUtils.rejectIfEmptyOrWhitespace(e, "company", "field.required", "Error with name!");
        ValidationUtils.rejectIfEmptyOrWhitespace(e, "header", "field.required", "Error with header!");
        ValidationUtils.rejectIfEmptyOrWhitespace(e, "post", "field.required", "Error with text!");
       Complaint a = (Complaint) obj;
    }

}
