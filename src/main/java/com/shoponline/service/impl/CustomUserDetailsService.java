package com.shoponline.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.shoponline.constant.SystemConstant;
import com.shoponline.dto.MyUser;
import com.shoponline.entity.RoleEntity;
import com.shoponline.entity.UserEntity;
import com.shoponline.repository.UserRepository;


public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private UserRepository userRepository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		if(userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		//put thong tin vao security duy tri thong tin do khi user login vao the thong
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true,true, true, authorities);
		myUser.setFullName(userEntity.getFullName());
		return myUser;
	}

}
