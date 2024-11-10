% Налаштування для окремого визначення фактів
:- discontiguous is_a/2.
:- discontiguous part_of/2.

% Факти, що описують типи транспорту (is_a)
is_a(auto, transport).
is_a(bicycle, transport).
is_a(coach, transport).
is_a(lorry, transport).
is_a(scooter, transport).
is_a(jet, air_vehicle).
is_a(chopper, air_vehicle).
is_a(dinghy, marine_vehicle).
is_a(vessel, marine_vehicle).
is_a(submersible, marine_vehicle).
is_a(locomotive, rail_transport).
is_a(street_vehicle, transport).
is_a(airborne_vehicle, air_vehicle).
is_a(weighty_vehicle, transport).
is_a(agile_vehicle, transport).
is_a(shared_transport, transport).
is_a(private_transport, transport).
is_a(business_transport, transport).
is_a(rescue_vehicle, transport).

% Факти про відношення "частина-ціле" (part_of)
part_of(car, personal_transport).
part_of(bike, personal_transport).
part_of(bus, public_transport).
part_of(truck, commercial_transport).
part_of(motorcycle, personal_transport).
part_of(airplane, air_transport).
part_of(helicopter, air_transport).
part_of(boat, water_transport).
part_of(ship, water_transport).
part_of(submarine, underwater_transport).
part_of(train, rail_transport).
part_of(public_transport, transport_system).
part_of(personal_transport, transport_system).
part_of(commercial_transport, transport_system).
part_of(emergency_vehicle, transport_system).
part_of(vehicle, transport_system).

% Правила для виведення нових відносин
% Правило, що показує транзитивність відносин типу
is_a(X, Z) :- is_a(X, Y), is_a(Y, Z).

% Правило для відношення "частина-ціле" з транзитивністю
part_of(X, Z) :- part_of(X, Y), part_of(Y, Z).

% Якщо X є частиною Y, і Y є типом Z, тоді X теж є типом Z
is_a(X, Z) :- part_of(X, Y), is_a(Y, Z).

% Виведення: Кожен транспорт належить до транспортної системи
is_a(X, transport_system) :- is_a(X, vehicle).
is_a(X, transport_system) :- is_a(X, aircraft).
is_a(X, transport_system) :- is_a(X, watercraft).
is_a(X, transport_system) :- is_a(X, rail_vehicle).

% Правила, що забороняють певні зв'язки для деяких видів транспорту
is_a(X, vehicle) :- not(is_a(X, underwater_transport)).
is_a(X, aircraft) :- not(is_a(X, watercraft)).

% Додаткові правила для визначення категорій
is_a(X, public_transport) :- is_a(X, bus).
is_a(X, public_transport) :- is_a(X, train).
is_a(X, emergency_vehicle) :- is_a(X, fire_truck).
is_a(X, emergency_vehicle) :- is_a(X, ambulance).

% Приклад запиту для перевірки: ?- is_a(X, transport).
