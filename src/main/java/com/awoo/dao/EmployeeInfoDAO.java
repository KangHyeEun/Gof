package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.HolidayVO;
import com.awoo.vo.InfoVO;

@Mapper
public interface EmployeeInfoDAO {
	public List<EmployeeInfoVO> selectEmployee();
	
	public void insertDataE(EmployeeInfoVO vo);

	public List<EmployeeInfoVO> selectEmpno();
	
	public List<InfoVO> selectInfo1();

	public List<InfoVO> edepartment();
	
	public int countInfoE();
	
	/*휴가*/
	public List<EmployeeInfoVO> selectEmpnoH(int empno);
	
	public void updateUsedHoliday(HolidayVO vo);
}
