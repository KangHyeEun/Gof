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
	
	public void updateE(EmployeeInfoVO vo);

	public List<EmployeeInfoVO> selectEmpno();
	/*리스트(조직도)*/
	public List<InfoVO> selectInfo1();
	/*부서(조직도)*/
	public List<InfoVO> edepartment();
	
	public int countInfoE();
	
	/*연관검색*/
	public List<InfoVO> AssociatedSearch(InfoVO vo);
	
	/*휴가*/
	public void updateUsedHoliday(HolidayVO vo);

	public List<EmployeeInfoVO> selectHolidayTotal(int empno);

	public List<EmployeeInfoVO> HEdepartment();
}
