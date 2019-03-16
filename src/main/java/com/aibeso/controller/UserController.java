package com.aibeso.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibeso.model.Page;
import com.aibeso.model.User;
import com.aibeso.service.IUserService;
/**
 * <p>
 * 用户controller类
 * </p>
 *
 * @author aibeso
 * @since 2019-03-17
 */

@Controller  
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;
	
	//返回user主页
	@RequestMapping("/index")
	public String index(){  
	    return "page/user/list";
	}
	
	
	//返回user编辑页面
	@RequestMapping(value="/ajax_add_page" ,method=RequestMethod.POST)
	public String addPage(@RequestParam("id") String id){  
	    return "page/user/editUser_ajax";
	}
	
	//返回user编辑页面
	@RequestMapping(value="/ajax_edit_page" ,method=RequestMethod.POST)
	public String ajaxPage(@RequestParam("id") String id, Model model){  
		if(id != null) {
			int userId = Integer.parseInt(id);
			System.out.println(id);
			User user = userService.selectById(userId);
			model.addAttribute("currentUser", user);
			return "page/user/editUser_ajax";
		}
	    return  null;
	}
	
	//添加user
	@RequestMapping(value="/add" ,method=RequestMethod.POST)
	@ResponseBody
	public String addUser(User user) {
		System.out.println(user);
		boolean flag = userService.insert(user);
		System.out.println(flag);
		if (flag) {
			return "success";
		}
		return "failed";
	}
	
	//根据条件查询user列表
	@RequestMapping("/list")
	@ResponseBody
	public Map<Object, Object> getmyuserlist(Page<User> page, User user) {
		System.out.println(user);
		System.out.println(page);
		
		Map<Object, Object> map = new HashMap();
		map.put("total", userService.countPage(page, user));
	    map.put("rows", userService.listAll(page, user));
	     return map;
	}
	
	//保存user
	@RequestMapping(value="/saveUser" ,method=RequestMethod.POST , produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updatauser(User user) {
		System.out.println(user);
		//
		Integer id = user.getId();
		System.out.println(userService.count(user));
		if (userService.count(user) >= 1) {
			return "用户已经存";
		}
		//判断前端传回数据是否有id，没有id说明是新建用户，
		if(id == null) {
				return this.addUser(user);	
				//也可以直接调用service层接口insert
			}
		else {
			boolean flag = userService.updata(user);
			if (flag) {
				return "success";
			}
		}
		return "failed";
	}
	
	//根据ID删除user
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteuser(@RequestParam("id") String id, Model model) {
		int userId = Integer.parseInt(id);  
		boolean flag = userService.deleteById(userId);
	    System.out.println(flag);
	    if (flag) {
			return "success";
		}
		return "failed";
	}
}
