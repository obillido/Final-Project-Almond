package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.app.almond.service.EventService;
import project.app.almond.service.WinnerService;
import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Controller
public class EventController {
	@Autowired private EventService service;
	@Autowired private WinnerService ws;
	
	@RequestMapping("/event1")
	public String event1(){
		return ".event.1";
	}
	@RequestMapping(value="/event2", method=RequestMethod.GET )
	public String event2(int eventnum,Model model){
		model.addAttribute("eventnum",eventnum);
		List<UsersVo> list=ws.select(eventnum);
		if(list!=null) model.addAttribute("list",list);
		return ".event.2";
	}
	//event2 ��÷��� �̾ƿ���(��÷��Ȯ���������� �������� �˸�����..?��ư ��)
	@RequestMapping(value="/event2", method=RequestMethod.POST)
	public String event2select(int eventnum,Model model){
		int n=0;
		if(ws.check(eventnum)==0){//��÷��ư ������ ���̸� ����
			n=service.event2(eventnum);	
			if(n<1) model.addAttribute("msg","����");
		}else{//��÷��ư ������ ��÷�� ������ ��÷�� ����Ʈ�� ���
			List<UsersVo> list=ws.select(eventnum);
			model.addAttribute("list",list);
			model.addAttribute("msg","�̹� ����� �̺�Ʈ�Դϴ�.");
		}
		model.addAttribute("eventnum",eventnum);
		
		return ".event.2";
	}
	//home2���� �̺�Ʈ4�� ��������
	@RequestMapping(value="/event4", method=RequestMethod.GET)
	public String event4(int eventnum,Model model){		
		model.addAttribute("eventnum",eventnum);
		List<UsersVo> list=ws.select(eventnum);
		if(list!=null) model.addAttribute("list",list);//�̺�Ʈ�����ߴ� ����� ���
		return ".event.4";
	}
	//�Ƹ�� �Է��ϰ� Ȯ�ι�ư ��������
	@RequestMapping(value="/event4",method=RequestMethod.POST)
	public String event4post(int eventnum, Model model, HttpSession session,String answer,UsersVo vo){						
			if(ws.check(eventnum)==0){//�̺�Ʈ�������� ������
				if(answer.equals("�Ƹ��")){
					int a=service.event4(vo,eventnum,session); //�Ƹ�� �Է��� ����� ĳ�þ�����Ʈ,�������̺� �μ�Ʈ
					if(a>0){
						model.addAttribute("msg","����");
					}else{ 
						model.addAttribute("msg","����");		
					}
				}else{
					model.addAttribute("msg","�����̾ƴմϴ�.");
				}
			}else{
				List<UsersVo> list=ws.select(eventnum);//������ ����� ����Ʈ�� ���
				model.addAttribute("list",list);
				model.addAttribute("msg","�̹� ����� �̺�Ʈ�Դϴ�.");
			}
			model.addAttribute("eventnum",eventnum);
			return ".event.4";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/event3")
	public String event3(){
		return ".event.3";
	}
	
	@RequestMapping("/event5")
	public String event5(){
		return ".event.5";
	}
	//event3 ��÷��� �̾ƿ���(���)
	@RequestMapping(value="/event3list")
	public String event3select(Model model){
		List<CommentsEpisodeVo> list=service.event3();
		model.addAttribute("list",list);
		return ".event.event3list";
	}
	//event3 ��÷��� �̾ƿ���(�������)
	@RequestMapping(value="/event3reading")
	public String event3reading(Model model){
		List<ReadingEpisodeVo> list=service.event3reading();
		model.addAttribute("list",list);
		return ".event.event3reading";
	}
	//event5 �귿 ��÷�ݾ� �޾ƿ���....
	@RequestMapping(value="/rullCash", method=RequestMethod.POST)
	@ResponseBody
	public String rullcash(UsersVo vo,HttpServletRequest req,int cash){	
		try{
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>");
			sb.append("<result>");
			if(cash>0){
				//service.updateCash(vo);
				sb.append("<code>success</code>");
			}else{
				sb.append("<code>fail</code>");
			}
			sb.append("</result>");		
		}catch(Exception e){		
			e.printStackTrace();
		}		
		return ".event.5";	
	}
	
	
	
	@RequestMapping("/test")
	public String test(){
		return ".event.test";
	}
}























