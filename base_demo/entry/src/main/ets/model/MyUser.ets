export class MyUser {
	userInfo?: UserInfo
	subscriptions?: Subscriptions[]
}

export class Subscriptions {
	title?: string
	subtitle?: string
	content?: string
	subscriptionId?: string
	likes?: number
}

export class UserInfo {
	name?: string
	age?: number
	address?: string
	account?: string
}
