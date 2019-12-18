package project.app.almond.scheduler;

import java.util.Date;

import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

@Component
public class AlarmScheduler extends DynamicAbstractScheduler{
	@Override
	public void runner(){
		System.out.println("runner : "+new Date());
		stopScheduler();
	}

	@Override
	public Trigger getTrigger() {
		//return new PeriodicTrigger(60,TimeUnit.SECONDS);
		return new CronTrigger("40 10/1 * * * *");
	}
}
