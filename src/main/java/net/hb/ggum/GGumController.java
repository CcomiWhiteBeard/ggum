package net.hb.ggum;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class GGumController {
	
	private static final Logger logger = LoggerFactory.getLogger(GGumController.class);
	
	@Autowired
	GGumDAO dao;
	
	@RequestMapping("/ggumList.do")		//����������
	public String ggumList(Model model, HttpSession session) {
		//�α��� ���� ó��
		String userid = (String) session.getAttribute("loggedInUser");
		model.addAttribute("disp", userid);
		
		//ggum_post ���� ggum_member �ҷ����� 
		List<GGumDTO> GG = dao.ggumSelect();
		model.addAttribute("GG", GG);
		
		return "ggumList";
	}
	
	
	@RequestMapping("/ggumReply.do")		
	public String ggumReply(Model model, GGumDTO dto, int idx, HttpSession session) {
		//�α��� ���� ó��
		String userid = (String) session.getAttribute("loggedInUser");
		model.addAttribute("disp", userid);
		
		model.addAttribute("pidx", idx);	
		
		List<GGumDTO> rp = dao.ggumSelectReply(idx);
		model.addAttribute("rp", rp);
		return "ggumReply";
	}
	
	@RequestMapping("/ggumReplyCommit.do")		
	public String ggumReplyCommit(Model model, GGumDTO dto, String idx, int pidx) {		
		dto.setId(idx);
		dto.setPost_idx(pidx);
		
		dao.ggumReplyCommit(dto);
		
		return "redirect:/ggumList.do";
		//return "redirect:/ggumReply.do?idx="+dto.getPost_idx();
	}
	
	@RequestMapping("/ggumDeleteReply.do")		//��� ����
	public String ggumDeleteReply(int idx) {
		dao.ggumDeleteReply(idx);
		return "redirect:/ggumList.do";
	}
	
	
	@RequestMapping("/ggumMyPage.do")		//���������� �̵�
	public String ggumMyPage(Model model, GGumDTO dto, HttpSession session) {
		//�α��� ���� ó��
		String userid = (String) session.getAttribute("loggedInUser");
		dto.setId(userid);
		
		List<GGumDTO> my = dao.ggumSelectMy(dto);
		model.addAttribute("my", my);
		
		return "ggumMyPage";
	}	
	
	@RequestMapping("/ggumDeleteCommit.do")		//����Ʈ ����
	public String ggumDeleteCommit(int idx) {
		dao.ggumDeleteCommit(idx);
		return "redirect:/ggumMyPage.do";
	}
	
	@RequestMapping("/ggumEdit.do")
	public String ggumEdit(Model model, int idx) {		
		model.addAttribute("po", dao.ggumSelectPost(idx));
		
		return "ggumMyPageEdit";
	}
	
	@RequestMapping("/ggumEditCommit.do")		//���� ������ ���� ����Ʈ ����
	public String ggumEditCommit(GGumDTO dto, int idx) {		
		dto.setPost_idx(idx);
		
		dao.ggumEditCommit(dto);
		return "redirect:/ggumMyPage.do";
	}
	
	
	@RequestMapping("/ggumUpload.do")		//���ε� ������ �̵�
	public String ggumUpload(Model model, HttpSession session) {
		//�α��� ���� -> ���ε� ������, �α׾ƿ� ���� -> �α���������
		if(session.getAttribute("loggedInUser") == null) {
			return "redirect:/ggumLogIn.do";
		}
		else {
			return "ggumUpload";
		}
	}
	
	@RequestMapping("/ggumUploadCommit.do")		//���� ���ε�
	public String ggumUploadCommit(GGumDTO dto, HttpSession session) {
		//�α��� ���� ó��
		String userid = (String) session.getAttribute("loggedInUser");
		dto.setId(userid);
		
		//�̹������� ó��
		String img = dto.getUploadFile().getOriginalFilename();
		dto.setPost_img(img);
		
		dao.ggumUploadCommit(dto);
		return "redirect:/ggumList.do?upload=true"; 
	}
	
	
	
	@RequestMapping("/ggumSignUp.do")		//ȸ������ ������ �̵�
	public String ggumSignUp(Model model) {	
		return "ggumSignUp";
	}
	
	@RequestMapping("/ggumSignUpCommit.do")		//ȸ������ ����
	public String ggumSignUpCommit(GGumDTO dto) {		
		//�̹������� ó��
		String img = dto.getUploadFile().getOriginalFilename();
		if(img == null || img == "") {
			dto.setProfile_img("profile_default.png");
		}
		else {
			dto.setProfile_img(img);
		}
		
		dao.ggumSignUpCommit(dto);		
		return "ggumLogIn";
	}
	
	
	
	@RequestMapping("/ggumLogIn.do")		//�α��� ������ �̵�
	public String ggumLogIn(Model model) {
		return "ggumLogIn";
	}
	
	@RequestMapping("/ggumLogInCommit.do")		//�α��� ���μ���
	public String ggumLogInCommit(GGumDTO dto, HttpSession session) {
		int cnt = dao.ggumLogInCommit(dto);
		if(cnt>0) {
			session.setAttribute("loggedInUser", dto.getId());
			return "redirect:/ggumList.do";	
		}
		else {
			session.removeAttribute("loggedInUser");
			return "redirect:/ggumLogIn.do?loginFail=true";
		}		
	}
	
	@RequestMapping("/ggumLogOut.do")		//�α׾ƿ� ���μ���
	public String ggumLogOut(HttpSession session) {
		session.removeAttribute("loggedInUser");
		System.out.println((String) session.getAttribute("loggedInUser"));
		return "redirect:/ggumList.do?logout=true";
	}
	
	
} //class END








