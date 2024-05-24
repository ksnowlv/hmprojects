export class UserModel {
	name: string = ''
	age: number = 0
	phoneNumber = ''
}


export class DataModel {
	id: number = 0
	userInfo: UserModel | null = null;
}