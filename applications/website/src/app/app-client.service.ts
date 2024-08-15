// @ts-ignore
import {Injectable} from '@angular/core';
// @ts-ignore
import {HttpClient} from "@angular/common/http";
import {EnvLoaderService} from "./env-loader.service";

// @ts-ignore
@Injectable({
  providedIn: 'root'
})
export class AppClientService {

  constructor(private httpClient: HttpClient, private envLoader: EnvLoaderService) {
  }


  public getLogs(): Promise<Array<{
    qr_id: string
    qr_content: string
    qr_url: string
    access_date: any
    is_s3: boolean
  }>> {
    return this.httpClient.get<Array<{
      qr_id: string
      qr_content: string
      qr_url: string
      access_date: any
      is_s3: boolean
    }>>(this.envLoader.getBackendUrl()).toPromise()
  }

  public sendLog(value: string): Promise<{
    qr_id: string
    qr_content: string
    qr_url: string
    access_date: any
    is_s3: boolean
  }> {
    return this.httpClient.post<{
      qr_id: string
      qr_content: string
      qr_url: string
      access_date: any
      is_s3: boolean
    }>(this.envLoader.getBackendUrl(), {
      qr_content: value
    }).toPromise()
  }
}
