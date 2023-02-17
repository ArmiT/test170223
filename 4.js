function printOrderTotal(responseString) {
    const responseJSON = JSON.parse(responseString);

    const total = responseJSON.reduce(
        (orderSubtotal, item) => item.price !== undefined ? orderSubtotal + parseInt(item.price): orderSubtotal,
        0
    );

    console.log(`Стоимость заказа: ` + (total > 0 ? `${total} руб.` : `Бесплатно`));
}
