import {Injectable} from '@angular/core';
import {HttpClient, HttpErrorResponse} from "@angular/common/http";
import {EnvLoaderService} from "./env-loader.service";

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
                                       .catch(this.handleError);
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
     .catch(this.handleError);
  }

  private handleError(error: HttpErrorResponse): Promise<any> {
    console.error('An error occurred:', error.message);
    console.error('Backend returned code', error.status);
    console.error('Body was:', error.error);
    return Promise.reject(error.message || error);
  }
}
