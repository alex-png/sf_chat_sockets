public class ParkLocator {
    public static List<string> country(String country) {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(country);
    }
}