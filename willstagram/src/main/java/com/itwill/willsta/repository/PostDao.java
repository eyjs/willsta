package com.itwill.willsta.repository;

import java.util.List;
import java.util.Map;

import com.itwill.willsta.domain.Post;
import com.itwill.willsta.domain.PostImage;

public interface PostDao {
	
	public int insert(Post post);
	
	public int insertImg(PostImage pi);
	
	public int update(Post post);
	
	public int delete(Integer pNo);
	
	public List<Post> selectMyList(String userId);
	
	public Post selectPost(Integer pNo);
	
	public List<PostImage> selectContents(Integer pNo);
	
	public String maxContentNo(Integer pNo);
	
}
