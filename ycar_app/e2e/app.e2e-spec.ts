import { YCarHMIAPPPage } from './app.po';

describe('ycar-hmi-app App', function() {
  let page: YCarHMIAPPPage;

  beforeEach(() => {
    page = new YCarHMIAPPPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
