package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.BackStageDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * @Author: Raymond Li
 * @Date: 2022/12/30 9:39
 * @Version 1.0
 */
public class BackStageDaoImpl implements BackStageDao {
    @Override
    public JSONObject getIndexData() {
        JSONObject obj = new JSONObject();
        String sql = "select * from item";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            int[] pets = {0, 0, 0, 0, 0};//dog,cat,bird,fish,reptile
            while (res.next()) {
                int stock = res.getInt("stock");
                switch (res.getString("category")) {
                    case "Dogs":
                        pets[0] += stock;
                        break;
                    case "Cats":
                        pets[1] += stock;
                        break;
                    case "Birds":
                        pets[2] += stock;
                        break;
                    case "Fish":
                        pets[3] += stock;
                        break;
                    case "Reptiles":
                        pets[4] += stock;
                        break;
                }
            }
            int max_index = getMax(pets);
            int min_index = getMin(pets);
            switch (max_index) {
                case 0:
                    obj.put("max_stock_pet", "dogs");
                    obj.put("max_stock", pets[max_index]);
                    break;
                case 1:
                    obj.put("max_stock_pet", "cats");
                    obj.put("max_stock", pets[max_index]);
                    break;
                case 2:
                    obj.put("max_stock_pet", "birds");
                    obj.put("max_stock", pets[max_index]);
                    break;
                case 3:
                    obj.put("max_stock_pet", "fish");
                    obj.put("max_stock", pets[max_index]);
                    break;
                case 4:
                    obj.put("max_stock_pet", "reptiles");
                    obj.put("max_stock", pets[max_index]);
                    break;
            }
            switch (min_index) {
                case 0:
                    obj.put("min_stock_pet", "dogs");
                    obj.put("min_stock", pets[min_index]);
                    break;
                case 1:
                    obj.put("min_stock_pet", "cats");
                    obj.put("min_stock", pets[min_index]);
                    break;
                case 2:
                    obj.put("min_stock_pet", "birds");
                    obj.put("min_stock", pets[min_index]);
                    break;
                case 3:
                    obj.put("min_stock_pet", "fish");
                    obj.put("min_stock", pets[min_index]);
                    break;
                case 4:
                    obj.put("min_stock_pet", "reptiles");
                    obj.put("min_stock", pets[min_index]);
                    break;
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    @Override
    public JSONObject getProductData() {
        JSONObject obj = new JSONObject();
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from orderitem where orderID >'" + getID_Start() + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                int[] sales = {0, 0, 0, 0, 0};
                while (res.next()) {
                    String itemID = res.getString("itemID");
                    sales[getCategoryIndex(itemID)]++;
                }
                int[] old = new int[5];
                System.arraycopy(sales, 0, old, 0, 5);
                Arrays.sort(sales);
                JSONArray arr = new JSONArray();

                int[] flags = {0, 0, 0, 0, 0};//用于判断是否添加
                for (int i = 4; i >= 0; i--) {
                    JSONObject pet_sale = new JSONObject();
                    String name = getCategory(old, sales[i], flags);
                    pet_sale.put("Category", name);
                    pet_sale.put("sale", sales[i]);
                    arr.add(pet_sale);
                    switch (name) {
                        case "Dogs":
                            flags[0] = 1;
                            break;
                        case "Cats":
                            flags[1] = 1;
                            break;
                        case "Birds":
                            flags[2] = 1;
                            break;
                        case "Fish":
                            flags[3] = 1;
                            break;
                        case "Reptiles":
                            flags[4] = 1;
                            break;
                    }
                }
                obj.put("sales_rank", arr);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public String getID_Start() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date).replaceAll("[[\\s-:punct:]]", "");

        String OrderID = time.substring(0, 6) + "00" + "000000" + "0000";//当月起始ID
        return OrderID;
    }

    public int getMax(int[] pets) {
        int index = 0;
        int max = pets[0];
        for (int i = 1; i < pets.length; i++) {
            if (pets[i] > max) {
                index = i;
                max = pets[i];
            }
        }
        return index;
    }

    public int getMin(int[] pets) {
        int index = 0;
        int min = pets[0];
        for (int i = 1; i < pets.length; i++) {
            if (pets[i] < min) {
                index = i;
                min = pets[i];
            }
        }
        return index;
    }

    public int getCategoryIndex(String itemID) {
        switch (itemID) {
            case "EST-10":
            case "EST-22":
            case "EST-23":
            case "EST-24":
            case "EST-25":
            case "EST-26":
            case "EST-27":
            case "EST-28":
            case "EST-6":
            case "EST-7":
            case "EST-8":
            case "EST-9":
                return 0;
            case "EST-14":
            case "EST-15":
            case "EST-16":
            case "EST-17":
                return 1;
            case "EST-18":
            case "EST-19":
                return 2;
            case "EST-1":
            case "EST-2":
            case "EST-20":
            case "EST-21":
            case "EST-3":
            case "EST-4":
            case "EST-5":
                return 3;
            case "EST-11":
            case "EST-12":
            case "EST-13":
                return 4;
        }
        return -1;
    }

    public String getCategory(int[] old, int x, int[] flags) {
        for (int i = 0; i < 5; i++) {
            if (old[i] == x) {
                if (flags[i] == 0) {
                    switch (i) {
                        case 0:
                            return "Dogs";
                        case 1:
                            return "Cats";
                        case 2:
                            return "Birds";
                        case 3:
                            return "Fish";
                        case 4:
                            return "Reptiles";
                    }
                }
            }
        }
        return null;
    }
}
