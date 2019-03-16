package com.aibeso.service;

/**
 * <p>
 * 用户服务接口
 * </p>
 *
 * @author aibeso
 * @since 2019-03-17
 */
import java.util.List;

import com.aibeso.model.Page;
import com.aibeso.model.User;

public interface IUserService {
	public boolean insert (User user);
	public User selectById(int Id);
	public List<User> selectListByIds(List ids);
	public List<User> listAll();
	public List<User> listAll(Page<User> page, User user);
	public boolean updata(User user);
	public boolean deleteById(int id);
	public int countPage(Page<User> page, User user);
	public int count(User user);
}
