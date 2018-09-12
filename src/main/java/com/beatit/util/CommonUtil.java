package com.beatit.util;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

@Component
public class CommonUtil {
	
	public JSONObject getFieldErrors(BindingResult bindingResult, JSONObject resultJson){
		try {
		List<FieldError> fieldErrors = bindingResult.getFieldErrors();
		for ( FieldError error: fieldErrors) {
			resultJson.put(error.getField(),error.getDefaultMessage());
			} 
		}catch (JSONException e) {
			e.printStackTrace();
		}
		return resultJson;
	}
	
}
