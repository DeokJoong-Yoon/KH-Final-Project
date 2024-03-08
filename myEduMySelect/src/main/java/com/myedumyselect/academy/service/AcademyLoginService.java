package com.myedumyselect.academy.service;

import com.myedumyselect.academy.vo.AcademyVo;

public interface AcademyService {

	AcademyVo getAcademyVo();
	
	
}

/*

package com.myedumyselect.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.myedumyselect.academy.vo.AcademyVo;

@Repository
public class AcademyService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public AcademyVo getAcademyVo() {
        String sql = "SELECT academy_number, academy_name, academy_gu_address, academy_dong_address, academy_road_address FROM tb_academy_source";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(AcademyVo.class));
    }
}


*/