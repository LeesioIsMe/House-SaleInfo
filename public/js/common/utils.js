template.defaults.imports.dateFormat = function (date, format) {
    // 设置语言为中文
    moment.locale('zh-cn');

    return moment(date).fromNow();
}
template.defaults.imports.priceFormat = function (price, format) {
    return price = format + Number.parseInt(price * 10000);
}

