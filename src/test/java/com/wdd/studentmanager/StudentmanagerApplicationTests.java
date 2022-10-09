package com.wdd.studentmanager;

import com.wdd.studentmanager.domain.Score;
import com.wdd.studentmanager.mapper.ScoreMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;

@RunWith(SpringRunner.class)
@SpringBootTest
public class StudentmanagerApplicationTests {

    @Autowired
    protected ScoreMapper scoreMapper;

    @Test
    public void scoreTest() {
        scoreMapper.queryFailScoreList(new HashMap<>());
    }

}
