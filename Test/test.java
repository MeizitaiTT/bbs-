import java.util.Date;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import com.bbs.model.User;

public class test {
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	@Before
	public void init(){
		Configuration conf = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(conf.getProperties()).buildServiceRegistry();
		sessionFactory = conf.buildSessionFactory(serviceRegistry);
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
	}
	@Test
	public void testSaveUsers(){
		User a = new User(1, "xxx", "ccc", 1, 2, 1, new Date(), "132", 1, "a");
		session.save(a);
	}
	@After
	public void destory(){
		transaction.commit();
		session.close();
		sessionFactory.close();
	}
}
