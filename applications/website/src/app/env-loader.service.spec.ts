import { TestBed } from '@angular/core/testing';

import { EnvLoaderService } from './env-loader.service';

describe('EnvLoaderService', () => {
  let service: EnvLoaderService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(EnvLoaderService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
