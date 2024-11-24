document.addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar');

  if (calendarEl) {
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'pt-br',
      events: [
        // Sample events, replace with dynamic data later
        { title: 'Serviço 1', start: '2024-11-25' },
        { title: 'Serviço 2', start: '2024-11-28' }
      ]
    });
    calendar.render();
  }
});
