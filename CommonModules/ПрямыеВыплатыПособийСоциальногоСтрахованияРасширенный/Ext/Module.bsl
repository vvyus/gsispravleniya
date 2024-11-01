﻿
#Область СлужебныйПрограммныйИнтерфейс
#Область ЗаявлениеВФССОВозмещенииВыплатРодителямДетейИнвалидов
&Вместо("ОбработкаЗаполненияЗаявленияОВыплатахРодителямДетейИнвалидов")
Процедура ГСИ_ОбработкаЗаполненияЗаявленияОВыплатахРодителямДетейИнвалидов(ДокументОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка) Экспорт
	ДокументОбъект.Оплаты.Очистить();
	ДокументОбъект.ФиксацияИзменений.Очистить();
	Таблица = ТаблицаОплатДляВозмещенияВыплатРодителямДетейИнвалидов(ДокументОбъект, Ложь);
	Если Таблица = Неопределено Тогда
		Возврат;
	КонецЕсли;
	//+ГС 28.05.2024             
	ДатаОтбора=НачалоМесяца(ДокументОбъект.Дата);
	УдаляемыеСтроки=Новый Массив;
	Для Каждого СтрТаблицы Из Таблица Цикл
		Если СтрТаблицы.Месяц<>ДатаОтбора Тогда
			УдаляемыеСтроки.Добавить(СтрТаблицы);
		КонецЕсли;	
	КонецЦикла;
	Для Каждого СтрМассива Из УдаляемыеСтроки Цикл
		Таблица.Удалить(СтрМассива);
	КонецЦикла;	
	//-ГС 28.05.2024
	ДокументОбъект.Оплаты.Загрузить(Таблица);
	ДокументОбъект.ФиксацияИзменений.Очистить();

КонецПроцедуры
#КонецОбласти
#КонецОбласти