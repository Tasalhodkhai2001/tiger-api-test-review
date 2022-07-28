package tiger.api.fakeData.review;

import java.util.Date;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;



public class FakeDataReview {

	public static String getEmail() {
		Faker fake = new Faker();
		return fake.name().firstName()+ fake.name().lastName() + "@gmail.com";
		
	}
	public static String getfirstName() {
		Faker fake = new Faker();
		return fake.name().firstName();
	}
	public static String getLastName() {
		Faker fake = new Faker();
		return fake.name().lastName();
	}
	public static String getTitle() {
		Faker fake = new Faker();
		return fake.name().title();
	}
	public static String getDob() {
		Faker fake = new Faker();
		Date date = fake.date().birthday();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		return dateFormat.format(date);
	}
	public static String getPhoneNumber() {
		Faker fake = new Faker();
		return fake.phoneNumber().phoneNumber();
	}
	public static String getPhoneExtension() {
		Faker fake = new Faker();
		return fake.phoneNumber().extension();
	}
	public static String getStreetAddress() {
		Faker fake = new Faker();
		return fake.address().city();
	}
	public static String getCityName() {
		Faker fake = new Faker();
		return fake.address().cityName();
	}
	public static String getStateName() {
		Faker fake = new Faker();
		return fake.address().state();
	}
	public static String getpostalCode() {
		Faker fake = new Faker();
		return fake.address().zipCode();
	}
	
}
