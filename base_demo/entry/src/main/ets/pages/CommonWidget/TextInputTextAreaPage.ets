@Entry
@Component
struct TextInputTextAreaPage {
	@Builder
	navigationTitle() {
		Column() {
			Text('输入控件TextInput&TextArea')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {
		List() {

			ListItem() {

				Column({ space: 10 }) {

					Text('TextInput有9种可选类型，分别为Normal基本输入模式、Password密码输入模式、Email邮箱地址输入模式、Number纯数字输入模式、PhoneNumber电话号码输入模式通过type属性进行设')

					TextInput({ placeholder: '我是普通输入框，请输入文本' }).type(InputType.Normal)
						.width('80%')

					TextInput({ placeholder: 'Password密码输入模式，请输入文本' }).type(InputType.Password)
						.width('80%')

					TextInput({ placeholder: 'Email邮箱地址输入模式，请输入文本' }).type(InputType.Email)
						.width('80%')

					TextInput({ placeholder: 'number纯数字输入模式，请输入文本' }).type(InputType.Number)
						.width('80%')

					TextInput({ placeholder: 'PhoneNumber电话号码输入模式，请输入文本' }).type(InputType.PhoneNumber)
						.width('80%')

					Text('---绑定onChange事件可以获取输入框内改变的内容。用户也可以使用通用事件来进行相应的交互操作---')

					TextInput()
						.onChange((value: string) => {
							console.info(value);
						})
						.onFocus(() => {
							console.info('获取焦点');
						})

					TextArea({ text: "多行输入框文字超出一行时会自动折行,可以试试看效果如何？" })
						.width('80%')

				}.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}
		}

	}

	build() {
		Column() {
			Navigation() {
				this.buildPage()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Full)

		}.width('100%')
		.height('100%')
	}
}