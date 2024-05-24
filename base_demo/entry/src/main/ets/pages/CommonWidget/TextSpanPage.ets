@Entry
@Component
struct TextSpanPage {
	@Builder
	navigationTitle() {
		Column() {
			Text('文本控件')
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

					Text('---引用Resource资源---')
					Text($r('app.string.app_name'))
						.baselineOffset(0)
						.fontSize(20)
						.border({ width: 5 })
						.borderColor(Color.Red)
						.borderRadius(5)
						.padding(10)
						.textAlign(TextAlign.Center)
						.width('80%')

					Text('---创建Span。\nSpan组件需要写到Text组件内，单独写Span组件不会显示信息，Text与Span同时配置文本内容时，Span内容覆盖Text内容---')

					Text('Text文本') {
						Span('Span文本内容')
					}
					.padding(10)
					.borderWidth(3)
					.borderColor(Color.Blue)
					.borderRadius(5)

					Text('---通过decoration设置文本装饰线及颜色--')

					Text() {
						Span('我是Span内容，').fontSize(16).fontColor(Color.Green)
							.decoration({ type: TextDecorationType.LineThrough, color: Color.Red })

						Span('你要去哪些').fontColor(Color.Blue).fontSize(16)
							.fontStyle(FontStyle.Italic)
							.decoration({ type: TextDecorationType.Underline, color: Color.Black })

						Span('，我要去北京').fontSize(16).fontColor(Color.Blue)
							.decoration({ type: TextDecorationType.Overline, color: Color.Green })
					}
					.borderWidth(3)
					.padding(10)
					.borderRadius(3)

					Text('---通过textCase设置文字一直保持大写或者小写状态---')
					Text() {
						Span('Where ARE YOU GOING?I AM GOING HOME\n').fontSize(12)
							.textCase(TextCase.LowerCase)
						Span('Where are you going?I am going home').fontSize(12)
							.textCase(TextCase.UpperCase)
					}
					.borderWidth(1)
					.padding(5)

					Text('---由于Span组件无尺寸信息，事件仅支持添加点击事件onClick---')

					Text() {
						Span('Span添加点击事件').fontSize(12)
							.onClick(() => {
								console.info('我是Span——onClick')
							})
					}
					.borderWidth(1)
					.padding(10)

					Text('---通过textAlign属性设置文本对齐样式---')
					Text('左对齐')
						.width('80%')
						.textAlign(TextAlign.Start)
						.border({ width: 1 })
						.padding(10)
					Text('中间对齐')
						.width('80%')
						.textAlign(TextAlign.Center)
						.border({ width: 1 })
						.padding(10)
					Text('右对齐')
						.width('80%')
						.textAlign(TextAlign.End)
						.border({ width: 1 })
						.padding(10)

					Text('---通过textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用（默认情况下文本自动折行）---')
					Text('通过textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用（默认情况下文本自动折行）')
						.width('80%')
						.maxLines(1)
						.textOverflow({ overflow: TextOverflow.None })
					Text('通过textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用，超出部分显示省略号')
						.width('80%')
						.maxLines(5)
						.textOverflow({ overflow: TextOverflow.Ellipsis })
					Text('通过textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用，超出后，文本将滚动显示')
						.width('80%')
						.maxLines(3)
						.textOverflow({ overflow: TextOverflow.Clip })

					Text('---通过lineHeight属性设置文本行高---')
					Text('This is the text with the line height set. This is the text with the line height set.')
						.width('80%')
						.fontSize(12)
						.border({ width: 1 })
						.padding(10)

					Text('This is the text with the line height set. This is the text with the line height set.')
						.width('80%')
						.fontSize(12)
						.border({ width: 1 })
						.padding(10)
						.lineHeight(30)

					Text('---通过decoration属性设置文本装饰线样式及其颜色---')

					Text('测试文本，通过decoration属性设置文本装饰线样式及其颜色')
						.decoration({
							type: TextDecorationType.LineThrough,
							color: Color.Red
						})
						.borderWidth(1).padding(10).margin(5)
					Text('测试文本，通过decoration属性设置文本装饰线样式及其颜色')
						.decoration({
							type: TextDecorationType.Overline,
							color: Color.Blue
						})
						.borderWidth(1).padding(10).margin(5)
					Text('测试文本，通过decoration属性设置文本装饰线样式及其颜色')
						.decoration({
							type: TextDecorationType.Underline,
							color: Color.Green
						})
						.borderWidth(1).padding(10).margin(5)

					Text('---通过letterSpacing属性设置文本字符间距---')

					Text('通过letterSpacing属性设置文本字符间距 This is the text content with letterSpacing 0.')
						.letterSpacing(0)
						.fontSize(12)
						.border({ width: 1 })
						.padding(10)
						.width('100%')
						.margin(5)
					Text('通过letterSpacing属性设置文本字符间距 This is the text content with letterSpacing 3.')
						.letterSpacing(3)
						.fontSize(12)
						.border({ width: 1 })
						.padding(10)
						.width('100%')
						.margin(5)
					Text('通过letterSpacing属性设置文本字符间距 This is the text content with letterSpacing -1.')
						.letterSpacing(-1)
						.fontSize(12)
						.border({ width: 1 })
						.padding(10)
						.width('100%')
						.margin(5)

					Text('---通过minFontSize与maxFontSize自适应字体大小，minFontSize设置文本最小显示字号，maxFontSize设置文本最大显示字号，minFontSize与maxFontSize必须搭配同时使用，以及需配合maxline或布局大小限制一起使用，单独设置不生效---')
						.fontSize(13)

					Text('通过minFontSize与maxFontSize自适应字体大小 测试文本，最大字号为30，最小字号为5，maxLines为1')
						.width('80%')
						.maxLines(1)
						.maxFontSize(30)
						.minFontSize(5)
						.border({ width: 1 })
						.padding(10)
						.margin(5)
					Text('通过minFontSize与maxFontSize自适应字体大小 测试文本，，最大字号为30，最小字号为5，maxLines为2')
						.width('80%')
						.maxLines(2)
						.maxFontSize(30)
						.minFontSize(5)
						.border({ width: 1 })
						.padding(10)
						.margin(5)
					Text('通过minFontSize与maxFontSize自适应字体大小 测试文本，最大字号为30，最小字号为15，高度为50')
						.width('80%')
						.height(50)
						.maxFontSize(30)
						.minFontSize(15)
						.border({ width: 1 })
						.padding(10)
						.margin(5)
					Text('通过minFontSize与maxFontSize自适应字体大小 测试文本，最大字号为30，最小字号为15，高度为100')
						.width('80%')
						.height(100)
						.maxFontSize(30)
						.minFontSize(15)
						.border({ width: 1 })
						.padding(10)
						.margin(5)

					Text("通过copyOption属性设置文本是否可复制粘贴?可以试试是否可以复制")
						.copyOption(CopyOptions.InApp)

					Text('Text组件可以添加通用事件，可以绑定onClick、onTouch等事件来响应操作')
						.onClick(() => {
							console.info('我是Text的点击响应onClick事件');
						})
						.onTouch((event?: TouchEvent) => {
							console.info('我是Text的onTouch事件');
						})

					Row() {
						Text("我是新闻热搜词条内容")
							.fontColor(Color.Blue)
							.maxLines(1)
							.textOverflow({ overflow: TextOverflow.Ellipsis })
							.fontWeight(300)
						Text("热")
							.margin({ left: 6 })
							.textAlign(TextAlign.Center)
							.fontColor(Color.White)
							.fontWeight(600)
							.backgroundColor(0x770100)
							.borderRadius(5)
							.width(15)
							.height(14)
					}

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