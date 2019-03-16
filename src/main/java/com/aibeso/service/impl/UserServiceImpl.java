package com.aibeso.service.impl;

/**
 * <p>
 * 用户服务实现类
 * </p>
 *
 * @author aibeso
 * @since 2019-03-17
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aibeso.dao.IUserDao;
import com.aibeso.model.Page;
import com.aibeso.model.User;
import com.aibeso.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{
    @Resource  
    private IUserDao userDao;

	@Override
	public boolean insert(User user) {
		// TODO Auto-generated method stub
		return userDao.insert(user);
	}

	@Override
	public User selectById(int Id) {
		// TODO Auto-generated method stub
		return userDao.selectById(Id);
	}

	@Override
	public List<User> selectListByIds(List ids) {
		// TODO Auto-generated method stub
		return userDao.selectListByIds(ids);
	}

	@Override
	public List<User> listAll() {
		// TODO Auto-generated method stub
		return userDao.listAll();
	}

	@Override
	public List<User> listAll(Page<User> page, User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", user.getUserName());
		map.put("password", user.getPassword());
		map.put("info", user.getInfo());
		map.put("email", user.getEmail());
		map.put("createTime", user.getCreateTime());
		map.put("start", (page.getPage()*page.getRows() - page.getRows()));//页码
		map.put("end", (page.getPage()*page.getRows() -1));//单页数量
		map.put("sidx", page.getSidx());//排序字段
		map.put("sord", page.getSord());//升降序
		return userDao.listAll(map);
	}

	@Override
	public boolean updata(User user) {
		// TODO Auto-generated method stub
		return userDao.updata(user);
	}

	@Override
	public boolean deleteById(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteById(id);
	}

	@Override
	public int countPage(Page<User> page, User user) {
		if (userDao.count(user) ==null) {
			return 0;
	    }		
		if (userDao.count(user)%page.getRows()>1) {
			return userDao.count(user)/page.getRows()+1;
		}
		else {
			return userDao.count(user)/page.getRows();
		}
	}
	
	public int count(User user) {
		if (this.userDao.count(user) ==null) {
			return 0;
	    }		
		return userDao.count(user);
	}
}

