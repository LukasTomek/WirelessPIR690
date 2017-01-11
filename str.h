/* 
 * File:   str.h
 * Author: lukas
 *
 * Created on 11 January 2017, 21:24
 */

#ifndef STR_H
#define	STR_H

#ifdef	__cplusplus
extern "C" {
#endif

    void dec_to_ascii_buf(uint16_t dec);
    void uint8_to_ascii_buf(uint8_t dec);
    void SP_send_buf(uint8_t str[]);
    void SP_send(uint8_t str[]);
    void uint8_send(uint8_t uint);
    
#ifdef	__cplusplus
}
#endif

#endif	/* STR_H */

