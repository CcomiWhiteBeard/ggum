package net.hb.ggum;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GGumDAO { 
	
	@Autowired
	SqlSessionTemplate temp; 
	
	
	public List<GGumDTO> ggumSelect() {
		List<GGumDTO> list = temp.selectList("ggum.selectAll");
		return list;
	}
	
	public List<GGumDTO> ggumSelectMy(GGumDTO dto) {
		List<GGumDTO> list = temp.selectList("ggum.selectMy", dto);
		return list;
	}
	
	public GGumDTO ggumSelectPost(int idx) {
		return temp.selectOne("ggum.selectPost", idx);
	}
	
	public List<GGumDTO> ggumSelectReply(int idx) {
		List<GGumDTO> list = temp.selectList("ggum.selectReply", idx);
		return list;
	}
	
	public void ggumReplyCommit(GGumDTO dto) {
		temp.insert("ggum.insertReply", dto);
	}
	
	public void ggumDeleteReply(int idx) {
		temp.delete("ggum.deleteReply", idx);
	}
	
	public void ggumDeleteCommit(int idx) {
		temp.delete("ggum.delete", idx);
	}
	
	public void ggumEditCommit(GGumDTO dto) {
		temp.update("ggum.update", dto);
	}
	
	public void ggumUploadCommit(GGumDTO dto) {
		temp.insert("ggum.insertPost", dto);
	}
	
	public void ggumSignUpCommit(GGumDTO dto) {
		temp.insert("ggum.insertMember", dto);
	}
	
	public int ggumLogInCommit(GGumDTO dto) {		
		return temp.selectOne("ggum.selectId", dto);
	}
	
	public int ggumCheckId(String id) {		
		return temp.selectOne("ggum.checkId", id);
	}
	
}//class BlogDAO END
