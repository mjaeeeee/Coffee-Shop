// 거푸집 (캡슐화)
public class Car {
	//클래스의 멤버
	String company; // 제조업체
	String model;   // 모델명
	String color;   // 색상
	int maxSpeed;   //최고속도
	int speed;      //현재속도
	
	//메소드
	void drive(int speed) {
		this.speed=speed;
	}
	// - 생성자(Constructor:건축자/구성자)
	// 필드값을 초기화 할 때 또는 초기화 작업을 수행할 때.
	// 클래스명과 동일한 메소드
	// 반환값 타입이 없음.
    // 자동실행=대놓고(명시적으로)호출하지 않음. <- new연산자 호출.
	Car(){   		//기본생성자(default constructor)
		this.company="KIA";
		this.model="Sorento";
		this.color="black";			//DoMain에 초기값들을 설정안하고 여기에서 미리 설정가능!
		this.maxSpeed=240;
		this.speed=0;
	}
	// 일반생성자가 있으면, 반드시 기본생성자도 존재해야 한다.
	// (일반생성자 없이) 기본생성자만 존재할 수 있다.
//	Car() {} 기본생성자를 이렇게 만들어 놓고 일반생성자 사용할 수 있다.
	// 생성자 오버로딩(Constructor Overloading) <- 다형성의 일종.
	Car(String sCompany,String sModel,String sColor,int nMaxSpeed,int nSpeed){
		this.company=sCompany;
		this.model=sModel;
		this.color=sColor;
		this.maxSpeed=nMaxSpeed;
		this.speed=nSpeed;
	}
	// String model, String color: 매개변수(parameter), **지역변수
	Car(String model,String color){
		this.company="Hyundai";
		this.model=model;
		this.color=color;
		this.maxSpeed=300;
		this.speed=0;
	}
	int Plus(int i,int j) {
		return i+j;
	}
}
