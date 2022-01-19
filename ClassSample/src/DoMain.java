//JAVA책 201Page 참조! 다형성
public class DoMain {

	public static void main(String[] args) {
		Car car=new Car();	//car=변수/객체 생성. 인스턴스(instance:실체/실존)
		
		
		System.out.println("제조업체: "+car.company);
		System.out.println("모델명: "+car.model);
		System.out.println("색상: "+car.color);		//출력.
		System.out.println("최고속도: "+car.maxSpeed);
		System.out.println("현재속도: "+car.speed);
		
		car.speed= 50;										//수정 출력.
		car.drive(60);
		System.out.println("수정된 속도: "+car.speed);
		System.out.println("---------------------");
		
		
		Car seltos=new Car("KIA","Seltos","White",240,0);
		
		System.out.println("제조업체: "+seltos.company);
		System.out.println("모델명: "+seltos.model);
		System.out.println("색상: "+seltos.color);		//출력.
		System.out.println("최고속도: "+seltos.maxSpeed);
		System.out.println("현재속도: "+seltos.speed);
		System.out.println("---------------------");
		
		Car kona=new Car("Kona","grey");
		
		System.out.println("제조업체: "+kona.company);
		System.out.println("모델명: "+kona.model);
		System.out.println("색상: "+kona.color);		//출력.
		System.out.println("최고속도: "+kona.maxSpeed);
		System.out.println("현재속도: "+kona.speed);
		System.out.println("---------------------");
		
		Car bmw=new Car("bmw","bmw530","black",400,0);
		
		System.out.println("제조업체: "+bmw.company);
		System.out.println("모델명: "+bmw.model);
		System.out.println("색상: "+bmw.color);		//출력.
		System.out.println("최고속도: "+bmw.maxSpeed);
		System.out.println("현재속도: "+bmw.speed);
	}

}
