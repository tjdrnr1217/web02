package config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import mapper.BoardMapper;
import mapper.ItemMapper;
import mapper.MemberMapper;



public class MyBatisContext {
	public static SqlSession getSqlSession() {
		try {
			BasicDataSource dataSource = new BasicDataSource();
			
			// h2 테스트용 database
			dataSource.setDriverClassName("org.h2.Driver");
			dataSource.setUrl("jdbc:h2:tcp://1.234.5.158:31521/ds207;Mode=Oracle");
			dataSource.setUsername("sa");
			dataSource.setPassword("");
			
			
//			오라클
//			dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
//			dataSource.setUrl("jdbc:oracle:thin:@01.234.5.158:11521:xe");
//			dataSource.setUsername("ds207");
//			dataSource.setPassword("pw207");


			TransactionFactory transactionFactory = new JdbcTransactionFactory();
			Environment environment = new Environment("development", transactionFactory, dataSource);
			Configuration config = new Configuration(environment);
			config.addMapper(BoardMapper.class);
			config.addMapper(ItemMapper.class);
			config.addMapper(MemberMapper.class);
		
		

			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(config);
			return factory.openSession(true); // true이면 자동으로 commit을 수행함
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
