package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import project.app.almond.service.EventHistoryService;
import project.app.almond.service.EventService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.service.WinnerService;
import project.app.almond.vo.EventHistoryVo;
import project.app.almond.vo.EventVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Controller
public class EventController {
	@Autowired private EventService service;
	@Autowired private WinnerService ws;
	@Autowired private EventHistoryService hs;
	@Autowired private WebcontentsService webs;
	
	@RequestMapping(value="/event/choice")
	public String regiFormChoice(Model model){
		return ".event.choice";
	}
	@RequestMapping(value="/event/regiForm",method=RequestMethod.GET)
	public String regiForm(int status,Model model){
		model.addAttribute("status",status);
		model.addAttribute("webCultype1",webs.getList(1));
		model.addAttribute("webCultype2",webs.getList(2));
		model.addAttribute("webCultype3",webs.getList(3));
		model.addAttribute("webCultype4",webs.getList(4));
		model.addAttribute("webCultype5",webs.getList(5));
		return ".event.regiForm";
	}

	@RequestMapping(value="event/insert",method=RequestMethod.POST)
	public String insertSortition(EventVo evo, MultipartFile file1, Model model){
		String uploadPath="C:/web/spring/almond/src/main/webapp/resources/event";//"C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/event";
		//"C:/web/spring/almond/src/main/webapp/resources/event";
		String img=null;
		if(file1.getOriginalFilename().length()>0) img=UUID.randomUUID()+"_"+file1.getOriginalFilename();
		evo.setImg(img);
		int status=evo.getStatus(), n;
		if(status<30){
			n=service.insertSortition(evo);
		}else if(status<40){
			n=service.insertRoulette(evo);
		}else{
			n=service.insertKeyword(evo);
		}
		if(n>0){
			try{
				InputStream is=file1.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+img);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
			}catch(IOException ie){
				ie.printStackTrace();
			}
		}
		return "redirect:/event/list";
	}
	
	
	@RequestMapping(value="/event/list")
	public String list(Model model){
		model.addAttribute("eventList",service.getList());
		Date sysdate=new Date(new java.util.Date().getTime());
		model.addAttribute("sysdate",sysdate);
		return ".event.list";
	}
	
	
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
	@RequestMapping(value="/event2/list", produces="application/xml;charset=utf-8")
	@ResponseBody
	public String event2select(int eventnum,int status){
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		if(status==1){
			if(ws.count(eventnum)==0){//��÷��ư ������ ���̸� ����
				int n=service.event2(eventnum);	
				if(n<1) sb.append("<code>fail</code>");
			}else{//��÷��ư ������ ��÷�� ������ ��÷�� ����Ʈ�� ���
				sb.append("<msg>�̹� ����� �̺�Ʈ�Դϴ�.</msg>");
			}
		}
		for(UsersVo vo:ws.select(eventnum)){
			System.out.println(vo.getUsernum()+" , "+vo.getNickname());
			sb.append("<user>");
			sb.append("<usernum>"+vo.getUsernum()+"</usernum>");
			sb.append("<nickname>"+vo.getNickname()+"</nickname>");
			sb.append("</user>");
		}
		sb.append("</result>");
		return sb.toString();
	}
	
	//home2���� �̺�Ʈ������3��������
	@RequestMapping(value="/event3",method=RequestMethod.GET)
	public String event3get(int eventnum,int eventnum2, Model model){
		model.addAttribute("eventnum",eventnum);
		model.addAttribute("eventnum2",eventnum2);
		List<UsersVo> list=ws.select(eventnum);//usersVo�� �޴°� �� ���� �ٲ���� ���� �̺�Ʈ3 ĳ�þ�����Ʈ������ ����,
		List<UsersVo> list2=ws.select(eventnum2);
		if(list!=null||list2!=null) {
			model.addAttribute("list",list);
			model.addAttribute("list2",list2);
		}
		return ".event.3";
	}
	//event3 ��÷��� �̾ƿ���(���)
	@RequestMapping(value="/event3",method=RequestMethod.POST)
	public String event3comments(int eventnum,int eventnum2,Model model,HttpSession session,WinnerVo vo){	
		int a=0;
		int b=0;
		int c=0;
		if(ws.count(eventnum)==0 ||ws.count(eventnum2)==0){
			a=service.event3comments(eventnum);
			b=service.event3reading(eventnum2);
			if(a<1||b<1) model.addAttribute("msg","����");
		}else{
			List<UsersVo> list=ws.select(eventnum);
			List<UsersVo> list2=ws.select(eventnum2);
			c=service.event3cash(vo, eventnum);
			model.addAttribute("list2",list2);
			model.addAttribute("list",list);			
			model.addAttribute("msg","�̹� ����� �̺�Ʈ�Դϴ�.");
		}
		model.addAttribute("eventnum2", eventnum2);
		model.addAttribute("eventnum", eventnum);
		return ".event.3";
	}
	//home2���� �̺�Ʈ4�� ��������
	@RequestMapping(value="/event4", method=RequestMethod.GET)
	public String event4(int eventnum,Model model,HttpSession session){		
		int usernum;
		Object un=session.getAttribute("usernum");
		if(un!=null){
			usernum=(Integer)un;
			model.addAttribute("usernum",usernum);
		}			 
		model.addAttribute("eventnum",eventnum);
		List<UsersVo> list=ws.select(eventnum);
		if(list!=null) model.addAttribute("list",list);//�̺�Ʈ�����ߴ� ����� ���
		return ".event.4";
	}
	//�Ƹ�� �Է��ϰ� Ȯ�ι�ư ��������
	@RequestMapping(value="/event4",method=RequestMethod.POST)
	public String event4post(int eventnum, Model model, HttpSession session,String answer,UsersVo vo,WinnerVo wvo){								
		int usernum=(Integer)session.getAttribute("usernum");
		
		if(ws.check(new WinnerVo(0,eventnum,usernum))==0){//�̺�Ʈ�������� ������
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
	
	@RequestMapping(value="/event5",method=RequestMethod.GET)
	public String event5(int eventnum,Model model,HttpSession session){
		int usernum;
		Object un=session.getAttribute("usernum");
		if(un!=null){
			usernum=(Integer)un;
			model.addAttribute("usernum",usernum);
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("usernum", usernum);
			map.put("eventnum", eventnum);
			EventHistoryVo ehvo=hs.historyList(map);//�̱��ߴ��� ���
			System.out.println("???:"+ehvo);
			if(ehvo!=null) model.addAttribute("already","true");
			else model.addAttribute("already","false");
		}
		model.addAttribute("eventnum",eventnum);
		return ".event.5";
	}
	
	//event5 �귿 ��÷�ݾ� �޾ƿ���....
	@RequestMapping(value="/event5/cash", produces="application/xml;charset=utf-8")
	@ResponseBody
	public String rullcash(HttpSession session,int eventnum,int price,Model model){	
		int usernum=(Integer)session.getAttribute("usernum");	
		List<WinnerVo> who=ws.whoList(eventnum);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		if(who!=null){//�귿������ �ִ��� Ȯ��, �������̺� �־����
			int a=service.event5(usernum, eventnum, price);		
			if(a>0){
				sb.append("<find>true</find>");
				sb.append("<success>����</success>");
			}else{
				System.out.println("a2"+a);
				sb.append("<find>fail</find>");
				sb.append("<fail>����</fail>");
			}
		}else{	
			sb.append("<find>sorry</find>");
			sb.append("<sorry>�̱���̾����ϴ�.</sorry>");
		}
		sb.append("</result>");
		model.addAttribute("usernum",usernum);
		model.addAttribute("eventnum",eventnum);
		return sb.toString();	
	}
	
	
	
	@RequestMapping("/test")
	public String test(){
		return ".event.test";
	}
}























