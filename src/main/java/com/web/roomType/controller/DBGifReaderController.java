package com.web.roomType.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.web.roomType.model.service.RoomTypeService;


@WebServlet("/roomType/DBGifReader")
public class DBGifReaderController extends HttpServlet {
 private static final long serialVersionUID = 1L;

 public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

  res.setContentType("image/gif");
  ServletOutputStream out = res.getOutputStream();

  try {
   Integer roomTypeId = Integer.valueOf(req.getParameter("roomTypeId"));
   RoomTypeService roomTypeSvc = new RoomTypeService();
   out.write(roomTypeSvc.getOneRoomType(roomTypeId).getRoomTypePhoto());
  } catch (Exception e) {
   InputStream in = getServletContext().getResourceAsStream("");
   byte[] buf = new byte[in.available()];
   in.read(buf);
   out.write(buf);
   in.close();

  }
 }
}