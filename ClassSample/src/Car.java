// ��Ǫ�� (ĸ��ȭ)
public class Car {
	//Ŭ������ ���
	String company; // ������ü
	String model;   // �𵨸�
	String color;   // ����
	int maxSpeed;   //�ְ�ӵ�
	int speed;      //����ӵ�
	
	//�޼ҵ�
	void drive(int speed) {
		this.speed=speed;
	}
	// - ������(Constructor:������/������)
	// �ʵ尪�� �ʱ�ȭ �� �� �Ǵ� �ʱ�ȭ �۾��� ������ ��.
	// Ŭ������� ������ �޼ҵ�
	// ��ȯ�� Ÿ���� ����.
    // �ڵ�����=�����(���������)ȣ������ ����. <- new������ ȣ��.
	Car(){   		//�⺻������(default constructor)
		this.company="KIA";
		this.model="Sorento";
		this.color="black";			//DoMain�� �ʱⰪ���� �������ϰ� ���⿡�� �̸� ��������!
		this.maxSpeed=240;
		this.speed=0;
	}
	// �Ϲݻ����ڰ� ������, �ݵ�� �⺻�����ڵ� �����ؾ� �Ѵ�.
	// (�Ϲݻ����� ����) �⺻�����ڸ� ������ �� �ִ�.
//	Car() {} �⺻�����ڸ� �̷��� ����� ���� �Ϲݻ����� ����� �� �ִ�.
	// ������ �����ε�(Constructor Overloading) <- �������� ����.
	Car(String sCompany,String sModel,String sColor,int nMaxSpeed,int nSpeed){
		this.company=sCompany;
		this.model=sModel;
		this.color=sColor;
		this.maxSpeed=nMaxSpeed;
		this.speed=nSpeed;
	}
	// String model, String color: �Ű�����(parameter), **��������
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
