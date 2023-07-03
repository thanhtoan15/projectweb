package com.poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet(urlPatterns = {"/index","/favorites","/history"})
public class HOMECOLLER extends HttpServlet{

	private static final long serialVersionUID = -7911319772642683326L;
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath(); // lấy uri vd: localhost 8080 asmjava4/index thì uri ở đây là /index
		switch (path) {
			case "/index":
				doGetIndex(req, resp);
				break;
			case "/favorites":
				doGetFavorites(session,req, resp);
				break;
			case "/history":
				doGetHistory(session,req, resp);
				break;
		}
	}
	
	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("views/user/index.jsp").forward(req, resp);
	}
	
	private void doGetFavorites(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user =(User) session.getAttribute(SessionAttr.CURRENT_USER);
		List<History> histories = historyService.findByUserAndIsLiked(user.getUsername());
		List<Video> videos = new ArrayList<>();
		for (int i =0 ; i< histories.size(); i++) {
			videos.add(histories.get(i).getVideo());
		}
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("views/user/favorites.jsp").forward(req, resp);
	}
	
	private void doGetHistory(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user =(User) session.getAttribute(SessionAttr.CURRENT_USER);
		List<History> histories = historyService.findByUser(user.getUsername());
		List<Video> videos = new ArrayList<>();
		System.out.println();
		for (int i =0 ; i< histories.size(); i++) {
			videos.add(histories.get(i).getVideo());
			System.out.println(videos);
		}
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("views/user/history.jsp").forward(req, resp);
	}
}
