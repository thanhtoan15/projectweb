package com.poly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = "/video")
public class VideoController extends HttpServlet{

	
	private static final long serialVersionUID = 7388741981193937759L;
	
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		
		switch (actionParam) {
			case"watch":
				dogetWatch(session, href, req, resp);
				break;
			case"like":
				dogetLike(session, href, req, resp);
				break;
		}
	}
	
	private void dogetWatch(HttpSession session , String href ,HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		Video video = videoService.finByHref(href);
		req.setAttribute("video", video);
		
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		
		if(currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLikedBtn", history.getIsLiked());
		}
		
		req.getRequestDispatcher("/views/user/video-detail.jsp").forward(req, resp);
	}
	
	private void dogetLike(HttpSession session , String href ,HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		Boolean result = historyService.updateLikeOrUnlike(currentUser, href);
		if(result == true) {
			resp.setStatus(204); // gọi thành công nhưng không trả về data
		}else {
			resp.setStatus(204);
		}
	}
}
