

export class ArticleInfo {
	article?: Article
}
export class Article {
	id?: number
	title?: string
	content?: string
	author?: Author
	tags?: string[]
	comments?: Comments[]
}

export class Comments {
	id?: number
	text?: string
	author?: Author
}

export class Author {
	id?: number
	name?: string
}

