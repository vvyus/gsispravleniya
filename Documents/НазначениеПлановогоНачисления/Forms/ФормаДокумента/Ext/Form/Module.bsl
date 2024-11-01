﻿&НаСервере
Функция ПолучитьПустуюСсылкуНаСотрудника()
	Возврат Справочники.Сотрудники.ПустаяСсылка();
КонецФункции

&НаКлиенте
Процедура ГСИ_СотрудникиПриНачалеРедактированияВместо(Элемент, НоваяСтрока, Копирование) 

	Если НоваяСтрока Тогда
		
		МаксимальныйИдентификаторСтрокиСотрудника = МаксимальныйИдентификаторСтрокиСотрудника + 1;
		Элемент.ТекущиеДанные.ИдентификаторСтрокиСотрудника = МаксимальныйИдентификаторСтрокиСотрудника;
		
		Если Не Копирование Тогда
			
			Элемент.ТекущиеДанные.ДатаНазначения = Объект.ДатаНазначения;
			//+ГС 27.05.2024 
			Элемент.ТекущиеДанные.Сотрудник=ПолучитьПустуюСсылкуНаСотрудника();			
			//-ГС 27.05.2024
			Если ЗначениеЗаполнено(Объект.ДатаОкончания) Тогда
				Элемент.ТекущиеДанные.ДатаОкончания = Объект.ДатаОкончания;
			КонецЕсли;
			
		КонецЕсли;
		
		ОбновитьДопустимостьНулевогоЗначенияПоказателейСтроки(Элемент.ТекущиеДанные, КолонкиПоказателей, ОписаниеПоказателей);
		
	КонецЕсли;

КонецПроцедуры

