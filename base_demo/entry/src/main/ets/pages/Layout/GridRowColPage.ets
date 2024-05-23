@Entry
@Component
struct GridRowColPage {
	@State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown, Color.Red, Color.Orange, Color.Yellow, Color.Green];

	@Builder navigationTitle() {
		Column() {
			Text('栅格布局')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildPage() {

		List() {

			ListItem() {
				Column() {
					Text('栅格系统以设备的水平宽度（屏幕密度像素值，单位vp）作为断点依据，定义设备的宽度类型，形成了一套断点规则。开发者可根据需求在不同的断点区间实现不同的页面布局效果 \n' +
					'栅格系统默认断点将设备宽度分为xs、sm、md、lg四类' +
					'\n在GridRow栅格组件中，允许开发者使用breakpoints自定义修改断点的取值范围，最多支持6个断点，除了默认的四个断点外，还可以启用xl，xxl两个断点，支持六种不同尺寸（xs, sm, md, lg, xl, xxl）设备的布局设置')
						.width('90%')
				}.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}

			ListItem() {

				Column() {
					Text('columns默认值为12，即在未设置columns时，任何断点下，栅格布局被分成12列')
						.width('90%')
						.height(50)

					GridRow() {
						ForEach(this.bgColors, (item: Color, index?: number | undefined) => {
							GridCol() {
								Row() {
									Text(`${index}`)
								}.width('100%').height('50')
							}.backgroundColor(item)
						})
					}.width('90%')

				}.width('100%')
				.height(120)
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Column() {
					Text('栅格布局在任何尺寸设备下都被分为columns列。栅格布局列数为4子元素默认占一列')
						.width('90%')
						.height(50)

					GridRow({ columns: 4 }) {
						ForEach(this.bgColors, (item: Color, index?: number | undefined) => {
							GridCol() {
								Row() {
									Text(`${index}`)
								}.width('100%').height('50')
							}.backgroundColor(item)
						})
					}
					.width('90%').height(160)
					.onBreakpointChange((breakpoint: string) => {
						// let CurrSet: CurrTmp = new CurrTmp()
						// CurrSet.set(breakpoint)
					})

				}
				.width('100%')
				.height('200')
				.backgroundColor(Color.Pink)
				.alignItems(HorizontalAlign.Center) // 设置Column的alignItems属性
				.justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })

			ListItem() {
				Column() {
					Text('栅格布局在任何尺寸设备下都被分为columns列。栅格布局列数为4子元素默认占一列')
						.width('90%')
						.height(50)

					Row() {
						GridRow({ columns: 7 }) {
							ForEach(this.bgColors, (item: Color, index?: number | undefined) => {
								GridCol() {
									Row() {
										Text(`${index}`)
									}.width('100%').height('50')
								}.backgroundColor(item)
							})
						}
						.width('100%').height('100%')
						.onBreakpointChange((breakpoint: string) => {
							// let CurrSet: CurrTmp = new CurrTmp()
							// CurrSet.set(breakpoint)
						})
					}
					.height(160)
					.width('90%')

				}.width('100%')
				.alignItems(HorizontalAlign.Center) // 设置Column的alignItems属性
				.justifyContent(FlexAlign.Center)
			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })

			ListItem() {

				Column() {
					Text('columns类型为GridRowColumnOption时，支持下面六种不同尺寸（xs, sm, md, lg, xl, xxl）设备的总列数设置，各个尺寸下数值可不同 sm尺寸为4列，md为8列')
						.width('90%')
						.height(70)

					GridRow({
						columns: { sm: 4, md: 8 },
						breakpoints: { value: ['200vp', '300vp', '400vp', '500vp', '600vp'] }
					}) {
						ForEach(this.bgColors, (item: Color, index?: number | undefined) => {
							if (index) {
								GridCol() {
									Row() {
										Text(`${index.toString() + 1}`)
									}.width('100%').height('50')
								}.backgroundColor(item)
							}
						})
					}
				}
				.width('100%')
				.alignItems(HorizontalAlign.Center) // 设置Column的alignItems属性
				.justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })

			ListItem() {

				Column() {

					Text('通过gutter属性设置子元素在水平和垂直方向的间距,给GridCol传参或者设置属性两种方式，设置span（占用列数），offset（偏移列数')
						.width('90%')
						.height(50)

					GridRow({ gutter: 10 }) {
						ForEach(this.bgColors, (color: Color, index?: number | undefined) => {
							GridCol({ span: 3 }) {
								Row() {
									Text(`${index}`)
								}.width('100%').height('50vp')
							}
							.backgroundColor(color)
						})
					}

					GridRow({ gutter: { x: 20, y: 10 } }) {
						ForEach(this.bgColors, (color: Color, index?: number | undefined) => {
							GridCol({ span: 4 }) {
								Row() {
									Text(`${index}`)
								}.width('100%').height('50vp')
							}
							.backgroundColor(color)
						})
					}
				}
				.width('100%')
				.alignItems(HorizontalAlign.Center) // 设置Column的alignItems属性
				.justifyContent(FlexAlign.Center)
			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })

			ListItem() {
				Column() {
					Text('当类型为GridColColumnOption时，支持六种不同尺寸（xs, sm, md, lg, xl, xxl）设备中子组件所占列数设置，各个尺寸下数值可不同')
						.width('90%')
						.height(70)

					GridRow() {
						ForEach(this.bgColors, (color: Color, index?: number | undefined) => {
							GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
								Row() {
									Text(`${index}`)
								}
								.width('100%')
								.height('50vp')
							}
							.backgroundColor(color)
						})
					}
				}.width('100%')
				.alignItems(HorizontalAlign.Center) // 设置Column的alignItems属性
				.justifyContent(FlexAlign.Center)
			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })

			ListItem() {
				Column() {
					Text('当类型为GridColColumnOption时，支持六种不同尺寸（xs, sm, md, lg, xl, xxl）设备中子组件所占列数设置,各个尺寸下数值可不同')
						.width('90%')
						.height(70)

					GridRow() {
						ForEach(this.bgColors, (color: Color, index?: number | undefined) => {
							GridCol({ offset: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
								Row() {
									Text('' + index)
								}.width('100%').height('50vp')
							}
							.backgroundColor(color)
						})
					}
				}.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })


			ListItem() {
				Column() {
					Text('栅格组件也可以嵌套使用，完成一些复杂的布局。' +
					'\n以下示例中，栅格把整个空间分为12份。第一层GridRow嵌套GridCol，分为中间大区域以及“footer”区域。第二层GridRow嵌套GridCol，分为“left”和“right”区域。子组件空间按照上一层父组件的空间划分，粉色的区域是屏幕空间的12列，绿色和蓝色的区域是父组件GridCol的12列，依次进行空间的划分')
						.width('90%')
						.height(150)

					GridRow() {
						GridCol({ span: { sm: 12 } }) {
							GridRow() {
								GridCol({ span: { sm: 2 } }) {
									Row() {
										Text('left').fontSize(24)
									}
									.justifyContent(FlexAlign.Center)
									.height('90%')
								}.backgroundColor('#ff41dbaa')

								GridCol({ span: { sm: 10 } }) {
									Row() {
										Text('right').fontSize(24)
									}
									.justifyContent(FlexAlign.Center)
									.height('90%')
								}.backgroundColor('#ff4168db')
							}
							.backgroundColor('#19000000')
							.height('100%')
						}

						GridCol({ span: { sm: 12 } }) {
							Row() {
								Text('footer').width('100%').textAlign(TextAlign.Center)
							}.width('100%').height('10%').backgroundColor(Color.Pink)
						}
					}
					.width('100%')
					.height(300)

				}
				.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}.margin({ top: 10, bottom: 10, left: 10, right: 10 })

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