package com.core.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;

public class CommonUtil {

	public static <P> P json2Pojo(HttpServletRequest request, Class<P> classOfPojo) {
		try (BufferedReader br = request.getReader()) {
			return Constants.GSON.fromJson(br, classOfPojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static <P> void writePojo2Json(HttpServletResponse response, P pojo) {
		response.setContentType(Constants.JSON_MIME_TYPE);
		try (PrintWriter pw = response.getWriter()) {
			pw.print(Constants.GSON.toJson(pojo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
