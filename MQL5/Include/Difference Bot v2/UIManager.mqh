#include <Difference Bot v2/Others.mqh>

class UIManager
{
  string ui_name;
  string symbol[2];

  public: 
    bool OnInit()
    {
      ui_name = "DifferenceBotV2";

      LabelCreate(ChartID(), ui_name + "_diff",                4,  87,  "Diff: ", 9, C'248, 248, 248');
      LabelCreate(ChartID(), ui_name + "_current_step",        4,  74,  "Step: 0", 9, C'248, 248, 248');
      LabelCreate(ChartID(), ui_name + "_profit",              4,  61,  "Profit: 0 $", 9, C'248, 248, 248');
      LabelCreate(ChartID(), ui_name + "_us30_price",          4,  48,  "Us30 Price: 0", 9, C'248, 248, 248');
      LabelCreate(ChartID(), ui_name + "_ustech_price",        4,  35,  "Ustech Price: 0", 9, C'248, 248, 248');
      LabelCreate(ChartID(), ui_name + "_price_diff",          4,  22,   "Price Diff: 0", 9, C'248, 248, 248');
      LabelCreate(ChartID(), ui_name + "_reference_line_diff", 4,  9,   "Reference Line Price Diff: 0", 9, C'248, 248, 248');
      return true;
    }

    void OnDeinit()
    {
      ObjectDelete(ChartID(), "_diff");
      ObjectDelete(ChartID(), "_current_step");
      ObjectDelete(ChartID(), "_profit");
      ObjectDelete(ChartID(), "_us30_price");
      ObjectDelete(ChartID(), "_ustech_price");
      ObjectDelete(ChartID(), "_price_diff");
      ObjectDelete(ChartID(), "_reference_line_diff");
    }

    void setSymbol(string _symbol, int index)
    {
      if(index <= 1 && index >= 0)
      {
        symbol[index] = _symbol;
      }
    }

    void setProfit(double _profit)
    {
      LabelTextChange(ChartID(), ui_name + "_profit", "Profit: " + DoubleToString(_profit) + " $");
    }

    void setUS30Price(double price)
    {
      LabelTextChange(ChartID(), ui_name + "_us30_price", "Us30 Price: " + DoubleToString(price));
    }

    void setUSTechPrice(double price)
    {
      LabelTextChange(ChartID(), ui_name + "_ustech_price", "Ustech Price: " + DoubleToString(price));
    }

    void setReferenceLinePriceDiff(double price)
    {
      LabelTextChange(ChartID(), ui_name + "_reference_line_diff", "Reference Line Price Diff: " + DoubleToString(price));
    }

    void setPriceDiff(double price)
    {
      LabelTextChange(ChartID(), ui_name + "_price_diff", "Price Diff: " + DoubleToString(price));
    }

    void setDiff(double price)
    {
      LabelTextChange(ChartID(), ui_name + "_diff", "Diff: " + DoubleToString(price));
    }
};