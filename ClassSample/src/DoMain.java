//JAVAå 201Page ����! ������
public class DoMain {

	public static void main(String[] args) {
		Car car=new Car();	//car=����/��ü ����. �ν��Ͻ�(instance:��ü/����)
		
		
		System.out.println("������ü: "+car.company);
		System.out.println("�𵨸�: "+car.model);
		System.out.println("����: "+car.color);		//���.
		System.out.println("�ְ�ӵ�: "+car.maxSpeed);
		System.out.println("����ӵ�: "+car.speed);
		
		car.speed= 50;										//���� ���.
		car.drive(60);
		System.out.println("������ �ӵ�: "+car.speed);
		System.out.println("---------------------");
		
		
		Car seltos=new Car("KIA","Seltos","White",240,0);
		
		System.out.println("������ü: "+seltos.company);
		System.out.println("�𵨸�: "+seltos.model);
		System.out.println("����: "+seltos.color);		//���.
		System.out.println("�ְ�ӵ�: "+seltos.maxSpeed);
		System.out.println("����ӵ�: "+seltos.speed);
		System.out.println("---------------------");
		
		Car kona=new Car("Kona","grey");
		
		System.out.println("������ü: "+kona.company);
		System.out.println("�𵨸�: "+kona.model);
		System.out.println("����: "+kona.color);		//���.
		System.out.println("�ְ�ӵ�: "+kona.maxSpeed);
		System.out.println("����ӵ�: "+kona.speed);
		System.out.println("---------------------");
		
		Car bmw=new Car("bmw","bmw530","black",400,0);
		
		System.out.println("������ü: "+bmw.company);
		System.out.println("�𵨸�: "+bmw.model);
		System.out.println("����: "+bmw.color);		//���.
		System.out.println("�ְ�ӵ�: "+bmw.maxSpeed);
		System.out.println("����ӵ�: "+bmw.speed);
	}

}
