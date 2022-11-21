//+------------------------------------------------------------------+
//|                                                         iSpy.mq5 |
//|                                            Copyright 2010, Lizar |
//|                                               lizar-2010@mail.ru |
//+------------------------------------------------------------------+
#define VERSION         "1.00"

#property version     VERSION
#property copyright   "© Copyright 2022"
#property link      "https://www.24capitalmanagement.com"
#property description "Automated Trade by Makinaaaa Gani"

#property indicator_chart_window

input long chart_id        = 0;  // chart id
input long custom_event_id = 0;  // event id

int OnInit() 
{
  IndicatorSetString(INDICATOR_SHORTNAME, "difference_bot_v2");
  
  return INIT_SUCCEEDED;
}

int OnCalculate (const int rates_total,      // size of price[] array
                 const int prev_calculated,  // bars, calculated at the previous call
                 const int begin,            // starting index of data
                 const double& price[]       // array for the calculation
)
{
  double new_price = (SymbolInfoDouble(_Symbol, SYMBOL_ASK) + SymbolInfoDouble(_Symbol, SYMBOL_BID)) / 2;

  //--- Initialization:
  if(prev_calculated==0) 
  { // Generate and send "Initialization" event
    EventChartCustom(chart_id, 0, (long)_Period, new_price, _Symbol);
    return(rates_total);
  }
  
  // When the new tick, let's generate the "New tick" custom event
  // that can be processed by Expert Advisor or indicator
  EventChartCustom(chart_id, custom_event_id + 1, (long)_Period, new_price, _Symbol);
  
  //--- return value of prev_calculated for next call
  return(rates_total);
}

