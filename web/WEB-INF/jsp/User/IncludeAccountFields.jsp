<h3>Account Information</h3>

    ReceiverName: <input type="text" name="ReceiverName" value="${sessionScope.User.receiverName}"/>
    Email:<input type="text" size="40" name="email" value="${sessionScope.User.email}" />
    Phone:<input type="text" name="phone" value="${sessionScope.User.phoneNumber}" />
    Country:<input type="text" size="40" name="country" value="${sessionScope.User.country}" />
    Province:<input type="text" size="40" name="province" value="${sessionScope.User.province}" />
    City:<input type="text" name="city" value="${sessionScope.User.city}" />
    district:<input type="text" size="4" name="district" value="${sessionScope.User.district}" />
    DetailedAddress:<input type="text" size="10" name="detailedAddress" value="${sessionScope.User.detailedAddress}" />


<h3>Profile Information</h3>
    Language Preference:
    <select name="languagePreference">
    <option value="english" selected="selected">english</option>
    <option value="japanese">japanese</option>
    </select>
    Favourite Category:
    <select name="favouriteCategoryId">
    <option value="FISH">FISH</option>
    <option selected="selected" value="DOGS">DOGS</option>
    <option value="REPTILES">REPTILES</option>
    <option value="CATS">CATS</option>
    <option value="BIRDS">BIRDS</option>
    </select>
Enable MyList
<input type="checkbox" name="listOption" value="${sessionScope.User.listOption}"/>
Enable MyBanner
<input type="checkbox" name="bannerOption" value="${sessionScope.User.bannerOption}"/>
