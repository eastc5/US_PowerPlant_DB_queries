## US Power PLants Data base

This is a collection of SQL queries of the EIA US_POWER_PLANTS database.
The data can be downloaded here: https://www.eia.gov/electricity/data/eia860/xls/eia8602015.zip
and more imformationregardingthe daatabase can be found here: https://www.eia.gov/electricity/data/eia860/

The excel data files from the zip folder were loaded into SQL Server Express using the 2016 SQL Server import and export wizard (64bit).A copy of the data used is stored in the data file.

The following queries were then performed.

* USEnergyMixPercent.sql Percentagge of US generating capacity (nameplate) by technology.
* InstalledCoalGasSolar.sql Installed name plant capacity per year of each of the five major generating technologies; natural gas, coal, nuclear, solar and wind.