package org.hihigh.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hihigh.domain.EventVO;
import org.hihigh.domain.FamilyVO;
import org.hihigh.persistance.FamilyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class FamilyServiceImpl implements FamilyService {

	@Setter(onMethod_=@Autowired)
    private FamilyMapper familyMapper;

    @Override
    public List<FamilyVO> getMemberList() {
        log.info("============memList ===========");
        return familyMapper.getMemberList();
    }
    
 
    
    @Override
    public boolean selectId(String id) {
    	log.info("Service :: selectId...................");
    	return familyMapper.selectId(id);
	}

    /*
    @Override
    public String login(FamilyVO fvo, HttpSession session) {
    	String name = familyMapper.login(fvo, session);
    	
    	if(name != null) {
    		session.setAttribute("id", fvo.getId());
    	} return name;
     }
*/
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void admdelMem(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FamilyVO getMyInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	
	@Override
	public List<Map<String, Object>> TotalAge() {
		return familyMapper.TotalAge();
	}
	@Override
	public Integer Balgre(String age) {
		return familyMapper.Balgre(age);
	}
	@Override
	public Integer Perge(String age) {
		return familyMapper.Perge(age);
	}
	@Override
	public Integer Fimrico(String age) {
		return familyMapper.Fimrico(age);
	}
	@Override
	public Integer National(String age) {
		return familyMapper.National(age);
	}
	@Override
	public Integer Geo(String age) {
		return familyMapper.Geo(age);
	}



	@Override
	public void updateMember(String id, String filename, String pwd, String tel, String email) {
		familyMapper.updateMember(id, filename, pwd, tel, email);
		
	}


	@Override
	public List<EventVO> getBalgre(String company) {
		return familyMapper.getBalgre(company);
	}



	@Override
	public String selectImg(String filename) {
		return familyMapper.selectImg(filename);
	}





	@Override
	public int count() {
		return familyMapper.count();
	}



	@Override
	public List<FamilyVO> mlistPage(int displayPost, int postNum) {
		return familyMapper.mlistPage(displayPost, postNum);
	}



	@Override
	public List<EventVO> myReservation(String id) {
		return familyMapper.myReservation(id);
	}



	@Override
	public void insertMember(FamilyVO family) {
	}



	@Override
	public void approveEvent(String id, String company) {
		familyMapper.approveEvent(id, company);
	}



	@Override
	public FamilyVO login(FamilyVO fvo) {
		return familyMapper.login(fvo);
	}



	@Override
	public void deleteById(String id) {
		familyMapper.deleteById(id);
	}



	@Override
	public FamilyVO idfind(FamilyVO fvo) {
		return familyMapper.idfind(fvo);
	}



	@Override
	public int pwdfind(FamilyVO fvo) {
		return familyMapper.pwdfind(fvo);
	}



	@Override
	public int pwdUpdate(FamilyVO fvo) {
		return familyMapper.pwdUpdate(fvo);
	}



	@Override
	public List<EventVO> admReser() {
		return familyMapper.admReser();
	}



}



























